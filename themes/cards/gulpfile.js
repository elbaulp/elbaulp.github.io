/* Refrences:
1. http://notes.iissnan.com/2016/publishing-github-pages-with-travis-ci
2. https://github.com/chrisjlee/hexo-theme-zurb-foundation/blob/e82f45a82bbaaee063bcb1298cd9793575afb142/gulpfile.js
3. https://github.com/gulpjs/gulp/blob/master/docs/recipes/delete-files-folder.md
4. https://hexo.io/api/
5. https://github.com/iissnan/theme-next-docs/blob/master/.travis.yml
*/

var gulp = require('gulp');
var minifycss = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var htmlmin = require('gulp-htmlmin');
var htmlclean = require('gulp-htmlclean');
var imagemin = require('gulp-imagemin');
var del = require('del');
var runSequence = require('run-sequence');
var Hexo = require('hexo');


gulp.task('clean', function() {
    return del(['public/**/*']);
});

// generate html with 'hexo generate'
var hexo = new Hexo(process.cwd(), {});
gulp.task('generate', function(cb) {
    hexo.init().then(function() {
        return hexo.call('generate', {
            watch: false
        });
    }).then(function() {
        return hexo.exit();
    }).then(function() {
        return cb()
    }).catch(function(err) {
        console.log(err);
        hexo.exit(err);
        return cb(err);
    })
})

gulp.task('minify-css', function() {
    return gulp.src('./public/**/*.css')
        .pipe(minifycss({
            compatibility: 'ie8'
        }))
        .pipe(gulp.dest('./public'));
});

gulp.task('minify-html', function() {
    return gulp.src('./public/**/*.html')
        .pipe(htmlclean())
        .pipe(htmlmin({
            removeComments: true,
            minifyJS: true,
            minifyCSS: true,
            minifyURLs: true,
        }))
        .pipe(gulp.dest('./public'))
});

gulp.task('minify-js', function() {
    return gulp.src('./public/**/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('./public'));
});

gulp.task('minify-img', function() {
    return gulp.src('./public/images/*')
        .pipe(imagemin())
        .pipe(gulp.dest('./public/images'))
})

gulp.task('compress', function(cb) {
    runSequence(['minify-html', 'minify-css', 'minify-js', 'minify-img'], cb);
});


//gulp.task('build', ['clean', 'generate', 'compress']);
gulp.task('build', function(cb) {
    runSequence('clean', 'generate', 'compress', cb)
});

gulp.task('default', [])

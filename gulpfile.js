var env         = require('minimist')(process.argv.slice(2)),
    gulp        = require('gulp'),
    plumber     = require('gulp-plumber'),
    stylus      = require('gulp-stylus'),
    uglify      = require('gulp-uglify'),
    concat      = require('gulp-concat'),
    jeet        = require('jeet'),
    rupture     = require('rupture'),
    koutoSwiss  = require('kouto-swiss'),
    prefixer    = require('autoprefixer-stylus'),
    imagemin    = require('gulp-imagemin'),
    cp          = require('child_process'),
    newer       = require('gulp-newer'),
    rename      = require('gulp-rename'),
    purify      = require('gulp-purifycss');

/**
 * Stylus task
 */
gulp.task('stylus', function(){
    gulp.src('static/src/styl/main.styl')
    .pipe(plumber())
    .pipe(stylus({
      use:[koutoSwiss(), prefixer(), jeet(), rupture()],
      compress: true
    }))
    //    .pipe(purify(['_site/**/*.js', '_site/**/*.html'], options = {info:true, rejected:true, minify:true}))
    .pipe(rename('stylesheet.html'))
    .pipe(gulp.dest('layouts/partials/'));
});

/**
 * Imagemin Task
 */
gulp.task('imagemin', function() {
  return gulp.src('src/img/**/*.{jpg,png,gif}')
    .pipe(newer('assets/img/'))
    .pipe(plumber())
    .pipe(imagemin({ optimizationLevel: 7, progressive: true, interlaced: true }))
    .pipe(gulp.dest('assets/img/'));
});

/**
 * Clean Css task
 */
gulp.task('unused-css', function() {
  return gulp.src('_includes/css/main.css')
        .pipe(purify(['_site/**/*.js', '_site/**/*.html'], options = {info:true, rejected:true, minify:true}))
    .pipe(gulp.dest('_includes/css/main.clean.css'));
});

/**
 * Default task, running just `gulp` will compile the stylus,
 * compile the jekyll site, launch BrowserSync & watch files.
 */
gulp.task('default', ['stylus']);

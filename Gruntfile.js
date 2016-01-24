'use strict';
module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        'Gruntfile.js',
        'assets/js/*.js',
        '!assets/js/plugins/*.js',
        '!assets/js/scripts.min.js'
      ]
    },
    uglify: {
      dist: {
        files: {
          'assets/js/scripts.min.js': [
            'assets/js/plugins/*.js',
            'assets/js/_*.js'
          ]
        }
      }
    },
    imagemin: {
      dist: {
        options: {
          optimizationLevel: 7,
          progressive: true
        },
        files: [{
          expand: true,
          cwd: 'images/',
          src: '{,*/}*.{png,jpg,jpeg}',
          dest: 'images/'
        }]
      }
    },
    svgmin: {
      dist: {
        files: [{
          expand: true,
          cwd: 'images/',
          src: '{,*/}*.svg',
          dest: 'images/'
        }]
      }
    },
    watch: {
      js: {
        files: [
          '<%= jshint.all %>'
        ],
        tasks: ['jshint','uglify']
      }
    },
    clean: {
      dist: [
        'assets/js/scripts.min.js'
      ]
    },
    sass: {                              // Task
      dist: {                            // Target
        options: {                       // Target options
          style: 'expanded',
          sourcemap: 'none'
        },
        files: {                         // Dictionary of files
          'assets/css/main.css': '_sass/main.scss'       // 'destination': 'source'
        }
      }
    },
    critical: {
      test: {
          options: {
              base: './',
              css: [
                  'assets/css/main.css'
              ],
              width: 1366,
              height: 768
          },
          src: '_site/como-recuperar-datos-borrados-de-un-disco/index.html',
          dest: 'assets/css/critical.css'
      }
    },
    cssmin: {
      target: {
        files: [{
          expand: true,
          cwd: 'assets/css',
          src: ['*.css', '!*.min.css'],
          dest: 'assets/css',
          ext: '.min.css'
        }]
      }
    },
  });

  // Load tasks
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-critical');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-newer');

  // Register tasks
  grunt.registerTask('default', [
    'clean',
    'newer:uglify',
    'newer:imagemin',
    'newer:svgmin',
    'newer:sass',
    'newer:critical',
    'newer:cssmin'
  ]);
  grunt.registerTask('dev', [
    'watch'
  ]);
  grunt.registerTask('images', [
    'newer:imagemin',
    'newer:svgmin'
  ]);
  grunt.registerTask('css', [
    'newer:sass',
    'newer:critical',
    'newer:cssmin'
  ]);
};
